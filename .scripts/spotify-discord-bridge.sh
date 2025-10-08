# this should allow discord and spotify to share and enable listen along
flatpak override --user --talk-name=org.mpris.MediaPlayer2.spotify com.discordapp.Discord
flatpak override --user --talk-name=org.freedesktop.DBus com.discordapp.Discord
flatpak override --user --own-name=org.mpris.MediaPlayer2.spotify com.discordapp.Discord
flatpak override --user --own-name=org.mpris.MediaPlayer2.spotify com.spotify.Client
# You can check what DBus names and interfaces Spotify exports using:
# flatpak run com.spotify.Client dbus-monitor --session "type='signal',interface='org.freedesktop.DBus.Properties'"
