function create-backup
  set subvolumes root home projects
  set parts / /var/games /var/projects
  for i in (seq (count $subvolumes))
    set subvol $subvolumes[$i]
    set part  $parts[$i]

    set backup (set_color green)Backup(set_color reset)

    printf "  %s $subvol ($part)\n" $backup
    sudo snapper -c $subvol create
  end
end
