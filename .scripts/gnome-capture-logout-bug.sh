sudo journalctl --since "10 minutes ago" > "$(date '+%Y-%m-%d-%H:%M')_logout-issue-journalctl.txt"
sudo dmesg --time-format=iso | awk -v date_cutoff="$(date -d '10 minutes ago' +'%Y-%m-%dT%H:%M')" '$1 "T"$2 >= date_cutoff' > "$(date '+%Y-%m-%d-%H:%M')_logout-issue-dmesg.txt"
sudo coredumpctl list --since "10 minutes ago" > "$(date '+%Y-%m-%d-%H:%M')_logout-issue-coredumpctl.txt"
mv *_logout-issue-* ~/WorkVault/Areas/Tech/Gnome/GnomeLogoutIssue/
