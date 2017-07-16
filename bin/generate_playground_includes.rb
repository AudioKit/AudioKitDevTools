#!/usr/bin/env ruby
require 'pp'
require 'active_support/all'
require 'action_view'
require 'fileutils'
require 'pathname'
require 'redcarpet'

def new_partial(template, name)
    ERB.new(File.new("templates/#{template}/_#{name}.erb").read, nil, '-' ).result
end

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)



output_folder = "../audiokit.github.io/_includes/playgrounds/"
FileUtils.mkdir_p(output_folder) unless File.directory?(output_folder)

skippable_lines = ["//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)", "//: ---"]


playground_names = ["Analysis", "Basics", "Effects", "Filters", "Playback", "Synthesis"]

playground_names.each do |playground_name|
    page_folders = ["../AudioKit/Playgrounds/AudioKitPlaygrounds/Playgrounds/#{playground_name}.playground/Pages/*"]
    page_folders.each_with_index do |folder|
        Dir.glob(folder) do |playground_page|
            playground_page_title = File.basename(playground_page, ".xcplaygroundpage")
            swift = File.open(playground_page + "/Contents.swift")

            results = ""

            markdown_block = ""
            code_block = ""

            swift.each {|swift_line|
                next if skippable_lines.include? swift_line.strip()
                if swift_line[0..2] == "//:" then
                    results << "\n{% highlight ruby %}" + code_block + "{% endhighlight %}\n" if !code_block.empty?
                    renderable_line = swift_line[3..-1]
                    pp
                    renderable_line = "<h2>#{renderable_line[3..-1]}</h2>" if renderable_line[0..2] == " # "
                    renderable_line = "<h3>#{renderable_line[4..-1]}</h3>" if renderable_line[0..3] == " ## "
                    renderable_line = "<h4>#{renderable_line[5..-1]}</h4>" if renderable_line[0..4] == " ### "
                    markdown_block << renderable_line
                    code_block = ""
                else
                    results << markdown.render(markdown_block) if !markdown_block.empty?
                    code_block << swift_line
                    markdown_block = ""
                end
            }
            results << markdown.render(markdown_block) if !markdown_block.empty?
            results << "\n{% highlight ruby %}" + code_block + "{% endhighlight %}\n" if !code_block.empty?

            subfolder = output_folder
            FileUtils.mkdir_p(subfolder) unless File.directory?(subfolder)
            FileUtils.mkdir_p(output_folder + "/#{playground_name}/") unless File.directory?(output_folder + "/#{playground_name}/")
            File.open(subfolder + "/#{playground_name}/#{playground_page_title.gsub(" ", "")}.html", 'w+') {|f| f.write(results) }
        end

    end

end
