class TopController < ApplicationController
  def all
    @start = params[:start].to_i
    top_all_buf = Request.order(count: :desc).all
    @top_all = top_all_buf[@start...@start+10]
    @allow_prev = !(top_all_buf[@start-10...@start] == []) && !top_all_buf[@start-10...@start].nil?
    @allow_next = !top_all_buf[@start+10...@start+20].nil?
  end

  def hour
    @start = params[:start].to_i
    top_hour_buf = Request.order(count: :desc).all.select{ |x| x.updated_at.localtime > Time.zone.now - 1.hour }
    @top_hour = top_hour_buf[@start...@start+10]
    @allow_prev = !(top_hour_buf[@start-10...@start] == []) && !top_hour_buf[@start-10...@start].nil?
    @allow_next = !top_hour_buf[@start+10...@start+20].nil?
  end

  def day
    @start = params[:start].to_i
    top_day_buf = Request.order(count: :desc).all.select{ |x| x.updated_at.localtime > Time.zone.now - 1.day }
    @top_day = top_day_buf[@start...@start+10]
    @allow_prev = !(top_day_buf[@start-10...@start].nil?) && !top_day_buf[@start-10...@start].nil?
    @allow_next = !top_day_buf[@start+10...@start+20].nil?
  end

  def week
    @start = params[:start].to_i
    top_week_buf = Request.order(count: :desc).all.select{ |x| x.updated_at.localtime > Time.zone.now - 7.days }
    @top_week = top_week_buf[@start...@start+10]
    @allow_prev = !(top_week_buf[@start-10...@start] == []) && !top_week_buf[@start-10...@start].nil?
    @allow_next = !top_week_buf[@start+10...@start+20].nil?
  end

  def month
    @start = params[:start].to_i
    top_month_buf = Request.order(count: :desc).all.select{ |x| x.updated_at.localtime > Time.zone.now - 1.month }
    @top_month = top_month_buf[@start...@start+10]
    @allow_prev = !(top_month_buf[@start-10...@start] == []) && !top_month_buf[@start-10...@start].nil?
    @allow_next = !top_month_buf[@start+10...@start+20].nil?
  end
end
