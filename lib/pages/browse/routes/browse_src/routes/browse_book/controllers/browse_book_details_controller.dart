import 'package:audicium/constants/utils.dart';
import 'package:audicium/services/library_manager.dart';
import 'package:audicium_extension_base/extension.dart';
import 'package:flutter/material.dart';

import 'package:audicium_models/audicium_models.dart';
import 'package:audicium_extension_base/audicium_extension_base.dart';

enum FutureStates {
  loading,
  done,
  error,
}

class BrowseBookDetailController {
  BrowseBookDetailController({required this.selectedBook});

  final library = get<LibraryService>();

  AudioBook? libraryBook; // stores the book from database if it exists
  final DisplayBook selectedBook; // stores the book selected from browse source

  final audioUriList =
      ValueNotifier(<AudioInfo>[]); // holds final list that will be displayed

  final isBookInLibrary = ValueNotifier(false);

  final metaDataState = ValueNotifier(FutureStates.loading);

  String? errorMessage;

  // @override
  // Future<void> onInit() async {
  //   await checkLibrary();
  //   debugPrint('isBookInLibrary: ${isBookInLibrary.value}');
  //   metaDataFutureListener();
  //   super.onInit();
  // }

  // async listeners
  void metaDataFutureListener() {
    final metaDataFuture =
        get<ExtensionController>().loadDetailsPage(selectedBook.bookUrl);

    metaDataFuture
        .then(
      setMetadata,
    )
        .onError(
      (error, stackTrace) {
        logger.e('Error getting metadata: $error');
        metaDataState.value = FutureStates.error;
        errorMessage = error.toString();
      },
    );
  }

  void streamUriListener(Stream<AudioInfo> bookUriStream) {
    bookUriStream.listen(
      cancelOnError: true,
      audioUriList.updateElement,
      onDone: () {
        // isMetaDataLoaded.value = true;
        metaDataState.value = FutureStates.done;
      },
      onError: (error, stack) {
        debugPrint('Error getting audio uri: $error');
        metaDataState.value = FutureStates.error;
        errorMessage = error.toString();
      },
    );
  }

  // database functions
  Future<void> checkLibrary() async {
    libraryBook = await library.isBookInLibrary(fastHash(selectedBook.bookUrl));
    // printMany(['check lib', libraryBook]);
    if (libraryBook != null) {
      audioUriList.updateList(libraryBook!.bookUris);
      isBookInLibrary.value = true;
      metaDataState.value = FutureStates.done;
    } else {
      // added this else here because user can add and remove book so it needs
      // to be reset
      isBookInLibrary.value = false;
    }
  }

  void convertBrowseBookToAudioBook() {
    if (libraryBook != null) return;

    libraryBook = AudioBook.fromBrowseAudioBook(
      book: selectedBook,
      bookUris: audioUriList.value,
    );
  }

  Future<void> saveBook() async {
    if (isBookInLibrary.value) {
      await library.removeAudioBook(libraryBook!.videoHash);
      await checkLibrary();
      return;
    }

    if (audioUriList.value.isEmpty) {
      metaDataState.value = FutureStates.done;
      logger.d('Empty [audioUriList] List');
      return;
    }

    final newBook = AudioBook.fromBrowseAudioBook(
      book: selectedBook,
      bookUris: audioUriList.value,
    );

    await library.saveAudiobook(newBook);
    await checkLibrary();
  }

  void setMetadata(BookMetaData value) {
    // if any information from the previous screen is empty, fill it with
    // the data from the scraper
    selectedBook.uploader ??= value.uploader;
    selectedBook.uploadDate ??= value.uploadDate;
    selectedBook.coverImage ??= value.coverImage;
    selectedBook.description ??= value.description;
    selectedBook.timeStamps = value.timeStamps;

    if (selectedBook.timeStamps != null) {
      debugPrint('TimeStamps');
      debugPrint(selectedBook.timeStamps?.length.toString());
    }

    var bookUriStream = const Stream<AudioInfo>.empty();

    // in-case we don't have any links
    if (value.bookUris == null) {
      return;
    }
    // in-case it can get all links immediately
    // we convert the list to a stream
    if (value.bookUris.runtimeType == List<AudioInfo>) {
      bookUriStream = Stream.fromIterable(value.bookUris! as List<AudioInfo>);
    } else {
      // in-case we have to wait for the link to be fetched
      bookUriStream = value.bookUris!;
    }
    streamUriListener(bookUriStream);
  }
}
