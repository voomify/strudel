#
# Chef Solo Config File
#
strudel_root = "#{Dir.tmpdir}/strudel"

log_level          :info
log_location       STDOUT
sandbox_path       "#{strudel_root}/sandboxes"
file_cache_path    "#{strudel_root}/cookbooks"
file_backup_path   "#{strudel_root}/backup"
cache_options      ({ :path => "#{strudel_root}/cache/checksums", :skip_expires => true })

# Optionally store your JSON data file and a tarball of cookbooks remotely.
#json_attribs "http://chef.example.com/dna.json"
#recipe_url   "http://chef.example.com/cookbooks.tar.gz"
cookbook_path File.expand_path(File.join(File.dirname(__FILE__), "..", "cookbooks"))
