class MedicalCentersController < ApplicationController
    def index
        @countries = MedicalCenter.pluck(:country).uniq
        @cities = params[:country].present? ? MedicalCenter.where(country: params[:country]).pluck(:city).uniq : []
        @medical_centers = MedicalCenter.all
    
        @medical_centers = @medical_centers.where(country: params[:country]) if params[:country].present?
        @medical_centers = @medical_centers.where(city: params[:city]) if params[:city].present?
        @medical_centers = @medical_centers.where("center_name ILIKE ?", "%#{params[:center_name]}%") if params[:center_name].present?
    end

    def medical_index
        country = params[:country]
        city = params[:city]
        
        if country.present? && city.present?
          centres = MedicalCenter.where(country: country, city: city).pluck(:id, :center_name)
          render json: { centres: centres.map { |id, center_name| { id: id, name: center_name } } }
        else
          render json: { centres: [] }
        end
    end
end
