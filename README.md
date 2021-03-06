# publish_dropbox plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-publish_dropbox)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-publish_dropbox`, add it to your project by running:

```bash
fastlane add_plugin publish_dropbox
```

## About publish_dropbox

This plugin  publishes artifacts over to Dropbox via a generated api token from Dropbox Developer API.

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Setting up

**Note:** Dropbox allows accessing their API only for authorized applications, so in order to use this plugin you must register a Dropbox app.

In order to register a Dropbox app you need to go to [Dropbox Developers](https://www.dropbox.com/developers/apps) site and create your own app. 

1. You only need a generated token from the Dropbox API (OAuth2 token).
2. For Fastlane you only need the app key and app secret if you don't have a token generated. You'll also have to come up with some name for the app, but this is not used by Fastlane in any way.
3. You also don't need to apply for production state of your app, and keep it in development phase unless you make heavy use of it. Even Dropbox themselves encourage staying in development state when the app is used as an internal tool. Read more [here](https://www.dropbox.com/developers/reference/developer-guide#production-approval).
4. You start with access for one user only, but in development state you can request access for up to 500 users, which should cover most of the use cases for Fastlane integration.

## Example

### Basic usage

    publish_dropbox(
        file_path: '/some/local-path/to/file.txt',
        dropbox_path: '/path/to/Dropbox/destination/folder',
        app_key: 'your-dropbox-app-key',
        app_secret: 'your-dropbox-app-secret'
    )

The `dropbox_path` parameter is optional - if not provided, the file at `file_path` would be put in the Dropbox root directory.

### Write modes

The default `write_mode` is `add`, which means that plugin will raise an error if the file already exists at the destination path. If you want to allow for overwriting, set the `write_mode` parameter like so:

    dropbox(
        file_path: '/some/local-path/to/file.txt',
        dropbox_path: '/path/to/Dropbox/destination/folder',
        write_mode: 'overwrite',
        app_key: 'your-dropbox-app-key',
        app_secret: 'your-dropbox-app-secret'
    )

For the more fine-grained overwriting you can set the `update` write mode, and pass the current file revision to update:

    dropbox(
        file_path: '/some/local-path/to/file.txt',
        dropbox_path: '/path/to/Dropbox/destination/folder',
        write_mode: 'update',
        update_rev: 'filerevisiontoupdate',
        app_key: 'your-dropbox-app-key',
        app_secret: 'your-dropbox-app-secret'
    )

The `update_rev` parameter is required for `update` write mode and ignored in other cases. Currently, if the current file revision on Dropbox doesn't match the provided revision, the plugin will fail (Dropbox API won't allow for the update).

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

## Thanks
Based on:
https://github.com/ayoy/fastlane-plugin-dropbox