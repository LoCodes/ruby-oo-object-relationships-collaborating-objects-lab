# MP3Importer
#   #initialize
#     accepts a file path to parse mp3 files from

require 'pry'

class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
   #     binding.pry
    end 


    #   #files
    #   loads all the mp3 files in the path directory
    #   normalizes the filename to just the mp3 filename with no path

    def files 
        @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end 


    #  #import
    #  imports the files into the library by creating songs from a filename



    def import
        files.each {|file| Song.new_by_filename}
    end 




end 