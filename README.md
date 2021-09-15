# How to setup your workstation
Whenever I get a new workstation I always find myself repeating the same steps to set it up just how I like. Here is a repo dedicated to documenting all the necessary steps and providing configuration files necessary. The following assumes installing to a macbook pro.

**MacOS provides a tool "Migration Assistant" to migrate your existing configuration from a backup or other mac to your new device. This is preferred to installing everything from sratch as described below.**
# Necessary Tools
### Karabiner Elements
- keyboard customizer for macos
- https://karabiner-elements.pqrs.org/
- This app has a critical modification to change `right-cmd+hjkl` to arrow keys 
### Magnet
- window manager for macos
- https://apps.apple.com/us/app/magnet/id441258766?mt=12
### Cyberduck
- remote file system manager
- https://cyberduck.io/download/
### Datagrip
- Database management tool
- https://www.jetbrains.com/datagrip/
### Docker
- Container virtualization
- https://docs.docker.com/docker-for-mac/install/
### CopyClip
- clipboard management
- https://apps.apple.com/us/app/copyclip-clipboard-history/id595191960?mt=12
### YubiKey Manager
- 2FA dongle
- https://www.yubico.com/products/services-software/download/yubikey-manager/
### VSCode
- extensible text editor
- https://github.com/microsoft/vscode
### Outlook/Excel/Word/Powerpoint
- Typical Enterprise requirement you probably already have it.
## Homebrew
Lots here I am not listing. General list of packages I know I use.
- golang
- kube-ps1
- git
- zsh
- zsh-completions
- zsh-syntax-highlighting
- pwgen
- openjdk
- openssl
- node
- psql
- kubectl
- kustomize
- kubeseal
- krew
- kops
- kind
- k9s
- awscli
- chromedriver
- gnu-sed
- gnupg
- jq
- yq
- httpie
- maven

## Other good software tools
- For each language, having a version manager is useful to change between python (pyenv),ruby (rbenv),java (jenv),terraform (tfenv), go ect versions. 
- 

# Configuration
## MacOS System (System Preferences)
- Increase trackpad speed to max (TrackPad)
- Reduce size of bottom bar. Auto Hide. (Dock)
- Autohide the top status bar.
- Key repeat Fast and Delay until Repeat Short (Keyboard)
- Use F1,F2 as standard function keys (Keyboard)
- Set chrome as the default browser
- Modify the applications that start on boot. (Users&Groups->LoginItems)
## MacOS System and Application Shortcuts
- Google Chrome: (Keyboard->Shortcuts->App Shortcuts->Google Chrome)
  - `Select Next Tab: cmd+'`
  - `Select Previous Tab: cmd+;'`
## Chrome Config
Typically logging into chrome should pull all your latest setup. Some extensions I recommend:
- Tab Position Options (critical for tab management)
- Web search navigator (open pages using tab and enter)
- Adblock Plus
- Dark Reader
- Cluster - Window & Tab Manager
- Ghostery - Privacy Ad Blocker
- JSON Viewer
- OneLogin or whatever MFA tool your company uses
## VSCode Config
Use the settings sync tool if available. My sync isnt working so I have attached my keybindings and settings json config files.
Some extensions worth getting:
- YAML
- HashiCorp Terraform
- Bracket Pair Colorizer

Install other extensions based on language requirements

# Terminal Config
You spend a great deal of time in the terminal as a developer. Shortcuts and automation will pay for themselves many times over.
### Vim Config
I don't change anything except make the tabs two spaces to make working with yaml files easier
### Zsh Config
Zsh is a feature rich, extensible shell. Most of my utility commands are provided through native plugins. Those that aren't are shown in the `.zshrc` file.
### git Config
I use the git plugin in zsh: https://kapeli.com/cheat_sheets/Oh-My-Zsh_Git.docset/Contents/Resources/Documents/index. 
### kubectl config
I use the kubectl plugin in zsh: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kubectl/kubectl.plugin.zsh. I have added some additional aliases and functions for common kubectl commands
### Other config
Apps often store your user config in a ~/.appname directory, some of which may be confidential. To migrate your mac its easiest to use the migration assistant here: https://support.apple.com/en-us/HT204350. or magic-wormhole: https://github.com/warner/magic-wormhole
# Workstation Ergonomics
When working, your arms should rest on the armrest and be parallel with the keyboard on your desk. The chair should be tall enough that your legs create close to a right angle. Your eyes should reach the top of your monitor.
## External Monitor
I use a 34" curved ultrawide here: https://www.lenovo.com/us/en/accessories/monitors/thinkvision-T34-20. If you are not gaming, any 34" curved ultrawide 1440x3440p will do fine. I had to install switchresX (https://www.madrau.com/srx_download/download.html) to have my macbook register the 1440x3440p resolution and 60hz refresh rate. If your monitor permits you can connect via usb-c. Otherwise a usbc to hdmi dongle will work fine.

My current recommendation is this product by LG: https://www.amazon.com/dp/B07YGZ7C1K/ref=cm_sw_em_r_mt_dp_Uk-4FbSJSAA50. If you work at night, make sure your monitor can go dark enough to not burn your eyes.

Use whatever monitor setup you like. Some prefer to remove their macbook in favor of an external keyboard/mouse. I prefer to use the macbook keyboard and trackpad (minimally) to do my work.

One issue you may encounter is that your macbook does not natively understand the resolutions available on your new display. To fix this you can install a tool such as SwitchResX: https://www.madrau.com/, then make a custom resolution based on the exported EDID configuration for you external display. You may also want to update the resolution of your macbook pro display so you get consistent mouse movements between your external display and your macbook pro.
## Desk
Most desks are too high. I have tried several computer desks and recommend this one: https://www.amazon.com/dp/B06XZV3F8F/ref=cm_sw_em_r_mt_dp_qj-4FbGGGK75P. Not only is it light, sturdy, and quick to setup, it also sites at an ideal height for your keyboard.
## Chair
Ergonomic office chairs are a highly opinionated topic. The top four chairs I have heard of are the steelcase leap, steelcase gesture, herman-miller embody, herman-miller aeron. Try each of them out if possible. I tried them all out and decided to purchase the steelcase leap on Amazon.
## Mouse
Personal preference but I prefer using shortcuts or the trackpad. One thing is if you are going to use a mouse is I recommend installing Scroll-Reverser (Reverses scroll direction), DiscreteScroll (prevents mouse wheel acceleration), and SensibleSideButtons(Allows you to use mouse side buttons) applications.

# Workflow Ergonomics
In the last section we discussed the physical requirements for ergonomic work. Here we discuss some ways to model and approach your common tasks.
## Application Layout
Using a window manager is a must. Layout will vary substantially between workflows and individuals. For myself, I typically have vscode which I use for majority of development tasks on the left half of my screen. The right half is used for chrome. Within vscode, I typically split up two panes to hold code and use the bottom third of the screen for two panes of integrated terminals.

Using virtual desktops can offer additional improvements over the basic window manager. Some ideas
- use virtual desktop 1 for issue tracking and note taking.
- use virtual desktop 2 for your primary development work with an IDE/terminal and browser
- use virtual desktop 3 for email and spotify

In addition to this I also keep Slack active on my macbook display directly beneath my external monitor.
