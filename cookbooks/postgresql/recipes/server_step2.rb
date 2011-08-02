script "create initial postgres database" do
  interpreter "bash"
  code <<-EOH
    sudo sysctl -w kern.sysv.shmall=65536
    sudo sysctl -w kern.sysv.shmmax=16777216
    mkdir -p /usr/local/var/postgres
    /usr/local/bin/initdb /usr/local/var/postgres -E "UTF8"
    EOH
    not_if {File.exists?("/usr/local/var/postgres/PG_VERSION")}
end

script "create the 'rails' postgres superuser role" do
  interpreter "bash"
  code <<-EOH
  echo "CREATE ROLE rails WITH SUPERUSER CREATEDB CREATEROLE LOGIN ENCRYPTED PASSWORD '';" | psql -d postgres
  EOH
end
