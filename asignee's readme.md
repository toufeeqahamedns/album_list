## Overview

The app has 3 screens, AlbumList, Details and EditAlbum / AddAlbum Screen.

### Flutter v1.22.5 is used

## Assumptions

As the app has just 3 screens, I thought of not having complex state management, rather there is simple state management provided by a single provider.

There is a need for a single list to be present at all the screens, so, I thought of adding the list to the same provider.

UI is not supposed to handle the business logic, pull out the business logic to provider. Doing so all the variable in provider are private and can be updated only in its class.

## What’s Left To Do 

There is 1 uncaught exception arising at the image loading when we add a random text to the url. There wont be any problem running the app if the dedugger is off or uncaught exception breakpoit is unchecked.

## Anything Else

Pagination - All the list items are loaded at once, we can have pagination if the API supports it.

We can have offline storage, as the new added album or edited album is present only for a single app launch.

A new repository can be introduced between web service and offline storage. This helps in having a single souce of truth for data.

## How to run the app

flutter run would suffice
