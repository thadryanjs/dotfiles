VERSION_TAG=$(date +%Y-%m-%d-%H-%M)
sudo podman build -t custom-silverblue-gnome:$VERSION_TAG .
# sudo podman build --no-cache -t custom-silverblue-gnome:$VERSION_TAG .
sudo bootc switch --transport containers-storage localhost/custom-silverblue-gnome:$VERSION_TAG
