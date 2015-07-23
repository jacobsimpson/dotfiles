# Mac Setup

The basic procedures I use for setting up a Mac I use.

1. Apple -> System Preferences -> Keyboard -> Use F1, F2 keys

2. Add home dir to side bar
    - http://forums.macrumors.com/threads/how-to-show-home-folder-in-finder-sidebar.1345541/
    - CMD-Shift-H - takes you to the home dir
    - CMD-Up - Takes you one dir up
    - Drag dir to the side bar

3. Install XCode Command line tools

    ```
    xcode-select --install
    ```

4. Install homebrew

    ```
    brew install ag  
    brew install caskroom/cask/brew-cask  
    brew cask install google-chrome  
    brew cask install spectacle # To remap Capslock to Esc.  
    brew cask install karabiner # To remap Pause to Eject for locking the screen.  
    brew cask install java  
    brew cask install iterm2  
    brew cask install atom  
    brew cask install intellij-idea  
    brew cask install seil  
    ```

5. Configure iTerm2
    - Preferences
    - Profiles -> Colors -> Load Presets - Pastel (Dark Background)

6. Install site specific Chrome for Gmail.

7. Use Seil to change the Capslock key to escape
    - https://pqrs.org/osx/karabiner/seil.html.en
    - http://stackoverflow.com/questions/127591/using-caps-lock-as-esc-in-mac-os-x
    - I had to map it to return, then to escape, but it worked.

8. Use Karabiner to change the Pause key to Eject, so you can lock the screen when using an external keybaord.

9. Tomtom MySports

