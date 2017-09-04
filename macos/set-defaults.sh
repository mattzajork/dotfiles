#!/bin/bash
#
# Sets macOS defaults
#
# Sources
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#   https://gist.github.com/brandonb927/3195465
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# General UI/UX
# ------------------------------------------------------------------------------

# Use AirDrop over every interface
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Show the ~/Library folder
chflags nohidden ~/Library

# Hide terminal's scrollbar unless scrolling
defaults write com.apple.Terminal AppleShowScrollBars -string WhenScrolling

# Disabling OS X Gate Keeper
# (You'll be able to install any app you want from here on, not just Mac App Store apps)
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Increasing the window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expanding the save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt
# Displaying ASCII control characters using caret notation in standard text views
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Disabling system-wide resume
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# Disabling automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Never go into computer sleep mode
systemsetup -setcomputersleep Off > /dev/null

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable smart quotes and smart dashes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# ------------------------------------------------------------------------------
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
# ------------------------------------------------------------------------------

# Increasing sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disabling press-and-hold for keys in favor of a key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)
defaults write NSGlobalDomain KeyRepeat -int 0

# Disabling auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Setting trackpad & mouse speed to a reasonable number
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# ------------------------------------------------------------------------------
# Screen
# ------------------------------------------------------------------------------

# Requiring password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enabling subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# ------------------------------------------------------------------------------
# Finder
# ------------------------------------------------------------------------------

# Showing icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Showing all filename extensions in Finder by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Showing status bar in Finder by default
defaults write com.apple.finder ShowStatusBar -bool true

# Allowing text selection in Quick Look/Preview in Finder by default
defaults write com.apple.finder QLEnableTextSelection -bool true

# Displaying full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disabling the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by defaul
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# Disabling disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Enabling snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# ------------------------------------------------------------------------------
# Dock & Mission Control
# ------------------------------------------------------------------------------

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate
defaults write com.apple.dock tilesize -int 36

# Speeding up Mission Control animations and grouping windows by application
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

# Setting Dock to auto-hide and removing the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# ------------------------------------------------------------------------------
# Safari & WebKit
# ------------------------------------------------------------------------------

# Showing Safari's bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool true

# Hiding Safari's sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disabling Safari's thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enabling Safariâ€™s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Making Safari's search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Removing useless icons from Safari's bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Enabling the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Adding a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# ------------------------------------------------------------------------------
# Mail
# ------------------------------------------------------------------------------

# Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# ------------------------------------------------------------------------------
# Terminal
# ------------------------------------------------------------------------------

# Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# ------------------------------------------------------------------------------
# Time Machine
# ------------------------------------------------------------------------------

# Preventing Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

# ------------------------------------------------------------------------------
# Messages
# ------------------------------------------------------------------------------

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as itâ€™s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# ------------------------------------------------------------------------------
# Misc Options
# ------------------------------------------------------------------------------

# Disable the sudden motion sensor as it's not useful for SSDs
sudo pmset -a sms 0

# Speeding up wake from sleep to 24 hours from an hour
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

# Disable computer sleep and stop the display from shutting off
sudo pmset -a sleep 0
sudo pmset -a displaysleep 0

# ------------------------------------------------------------------------------
# OSX Hardening
#
# https://github.com/jekil/hardentheworld/blob/master/OS/MacOS_10.12_Sierra/index.rst#applications
# ------------------------------------------------------------------------------

# By default, File Vault keys are kept when the system goes into standby mode.
# Destroy File Vault keys when entering standby mode
sudo pmset destroyfvkeyonstandby 1

# By default OS X creates metadata files in each directory to speed up browsing.
# These files could leak metadata, it is suggested to avoid creation of .DS_Store and AppleDouble files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# By default during stand-by, memory is kept powered on, this is prone to forensics acquisition of your memory.
# It is suggested to power off memory during standby
sudo pmset hibernatemode 25

# Many applications bundled in OS X, i.e. Text, save by default new documents to iCloud.
# It is suggested to set default save target to be a local disk, not iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Enable Application firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
