Puppet::Type.newtype(:backup) do
  @doc = "Type to create backup jobs."

  feature :backup_src_file,
    "The provider can backup files."

  feature :backup_src_mysql,
    "The provider can backup mysql databases."

  feature :backup_dst_file,
    "The provider can backup to a filesystem."

  feature :backup_dst_ssh,
    "The provider can backup over ssh."

  feature :backup_dst_webdav,
    "The provider can backup to webdav."

  feature :backup_mode_full,
    "The provider supports full backups."

  feature :backup_mode_inc,
    "The provider supports incremental backups."

  feature :backup_mode_diff,
    "The provider supports differential backups."

  ensurable

  newparam(:name, :namevar => true) do
    desc "The name of the backup job."
  end

  newproperty(:source) do
    desc "The data that should be backed up. This is normally a file or a
      directory but can also be a database or something completely different,
      depending on what the provider supports."
  end

  newproperty(:destination) do
    desc "The destination of the backup. This can be a directory or whatever
      the provider supports. Must be in URI notation (<scheme>://<path>)."
  end

  newproperty(:mode) do
    desc "The backup mode. The basic values are 'full' or 'incremental'.
      Most provider will create a full backup on the first invocation even
      when the mode is set to 'incremental'."

    newvalues(:full,:incremental)

    defaultto :incremental
  end

  newproperty(:prebackup) do
    desc "Before performing the backup job, execute the follwing action."
  end

  newproperty(:postbackup) do
    desc "After performing the backup job, execute the follwing action."
  end

  newproperty(:include, :array_matching => :all) do
    desc "Pattern to specifically include objects that would be excluded otherwise."
  end

  newproperty(:exclude, :array_matching) do
    desc "Pattern to exclude certain objects from the backup."
  end

  newproperty(:options) do
    desc "String of options that should be provided as-is to the backup
      provider."
  end

  newproperty(:jobpath) do
    desc "Directory where backup jobs should be stored."
    
    defaultto '/var/spool/puppetbackup'
  end
end
