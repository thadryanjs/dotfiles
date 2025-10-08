# Download Quarto tarball (update version as needed)
curl -L https://github.com/quarto-dev/quarto-cli/releases/download/v1.8.24/quarto-1.8.24-linux-rhel7-amd64.tar.gz -o quarto.tar.gz

# Extract tarball (creates a 'quarto' directory)
tar -xzf quarto.tar.gz

# Move quarto binary and support files to /usr/local (or /opt/quarto)
sudo mv quarto /usr/local/quarto

# Create symlink to make quarto accessible system-wide
sudo ln -sf /usr/local/quarto/bin/quarto /usr/local/bin/quarto

# Optional: cleanup
rm quarto.tar.gz

# Check quarto version
quarto --version
