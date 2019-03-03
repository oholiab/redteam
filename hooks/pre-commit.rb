#!/usr/bin/env ruby

require 'yaml'

# This script can be bypassed by using the --no-verify
# parameter when checking in

files_modified = `git diff-index --cached --name-only HEAD`
files_modified_arr = files_modified.split("\n")

# puts "Checking files: #{files_modified_arr.inspect}"

bad_files = 0

# Build a hash of all the keys and things you don't want
# checked in here.
# Note the pair of slashes before the slash quote, this
# is to ensure a slash quote is built into the string
# to be passed to grep.
top_directory = `git rev-parse --show-toplevel`.chomp
dorks_file = File.join(top_directory, '.dorks')

regexs = YAML.load(File.open(dorks_file, 'r').read)
files_modified_arr.each do |file|
    regexs.each_pair do |key_name, regex|
        grep_command = "grep -iE \"#{regex}\" #{file}"
        # puts grep_command
        res = `#{grep_command}`
        # puts res.inspect
        unless res == ""
            bad_files += 1
            puts "Match rule for #{key_name} on file: #{file}"
        end
    end
end

exit bad_files
