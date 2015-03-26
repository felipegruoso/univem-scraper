# encoding: utf-8

require 'mechanize'

class Scraper

  URL = "http://univem.edu.br/"

  def self.run
    Scraper.new.run
  end
  
  def initialize
    @agent = Mechanize.new
  end

  def run
    @agent.get URL
    courses = @agent.page.parser.css('.nomecurso')
    courses_name = courses.map do |course|
      course.text.gsub(/\:/, '').strip
    end

    puts courses_name
  end

end

Scraper.run
