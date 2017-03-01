class Api::V1::CorridorsController < ApplicationController

  before_action :restrict_access

  respond_to :json

  swagger_controller :corridors, 'Corridors'

  swagger_api :index do
    summary "Fetch the corridors infos"
    param :header, 'Authorization', :string, :required
    response :ok, "Success", :Corridors
    response :unauthorized, '(Unauthorized) Token is not present or token is invalid.'
  end

  def index
    file = File.read('json_files/corridors.json')
    json = JSON.parse file
    status = 200

    render json: json, status: status
  end

  def corridors2
    file = File.read('json_files/corridors2.json')
    json = JSON.parse file
    status = 200

    render json: json, status: status
  end

  def create
    hash = parse('json_files/corridors.json')
  end

end
