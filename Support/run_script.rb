require ENV["TM_SUPPORT_PATH"] + "/lib/tm/executor"
require ENV["TM_SUPPORT_PATH"] + "/lib/tm/htmloutput"
require ENV["TM_SUPPORT_PATH"] + "/lib/tm/save_current_document"

TextMate.save_current_document('oz')

require File.expand_path('../oz_compiler', __FILE__)

oz_version = `ozc -v 2>&1`.split("\n").first

if result = oz_compile(ENV['TM_FILEPATH']) { |executable|
    TextMate::Executor.run(executable, :use_hashbang => false, :version_replace => oz_version)
  }
  TextMate::HTMLOutput.show(:title => "Failed to compile #{File.basename(ENV['TM_FILEPATH'])}", :sub_title => oz_version) do |io|
    io << "<span class=\"stderr\">#{htmlize(result)}</span>"
  end
end