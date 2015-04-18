class SenditController < ApplicationController
  def index
    @members = Member.all
  end

  def doit
    params.require :body
    twilio   = Twilio::REST::Client.new
    @members = member_select
    @done    = []
    @members.each do |member|
      begin
        twilio.messages.create(
          from: OUR_NUMBER,
          to:   member.phone,
          body: params[:body]
        )
        @done << { name: member.name, status: "Success" }
      rescue StandardError => error
        @done << { name: member.name, status: error.to_s }
        next
      end
    end
  end

  private

  def member_select
    members = Member.all.select { |member| member.phone }
    members.uniq! { |member| member.phone }
    return members if params[:all] == "1"
    params[:members].map { |member| Member.find(member) }
  end

end
