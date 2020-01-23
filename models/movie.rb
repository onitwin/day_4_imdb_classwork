require_relative('../db/sql_runner')


class Movie

  attr_accessor :id, :title, :genre, :budget

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @title=options['title']
    @genre=options['genre']
    @budget=options['budget'].to_i
  end

  def save
    sql="INSERT INTO movies (title,genre,budget) VALUES ($1,$2,$3)
    RETURNING id"
    values=[@title,@genre,@budget]
    results=SqlRunner.run(sql,values)
    @id=results[0]['id'].to_i
  end

















end
