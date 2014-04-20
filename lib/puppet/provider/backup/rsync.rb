Puppet::Type.type(:backup).provide(:rsync) do
  desc "Provides the ability to create backup jobs using rsync."

  commands :rsync => '/bin/rsync'

  has_features :backup_src_file
  has_features :backup_dst_file
  has_features :backup_dst_ssh
  has_features :backup_mode_full
  has_features :backup_mode_inc

end
