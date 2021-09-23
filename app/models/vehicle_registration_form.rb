class VehicleRegistrationForm
  include ActiveModel::Model

  concerning :VehicleBuilder do
    def vehicle
      @vehicle ||= Vehicle.new
    end
  end

  concerning :ModleBuilder do
    attr_reader :model

    def model=(attributes)
      id = attributes[:id]
      @model = if id
                 Model.find(id).tap { |model| model.assign_attributes(attributes) }
               else
                 Model.new(attributes)
               end
    end
  end

  concerning :BrandBuilder do
    attr_reader :brand

    def brand=(attributes)
      @brand = Brand.find(attributes[:id])
    end
  end

  attr_accessor :year

  validates :model, presence: true
  validates :brand, presence: true

  def save # rubocop:disable Metrics/MethodLength
    return false if invalid?

    assigns
    ActiveRecord::Base.transaction do
      # FIXME: modelのattributesを更新する場合、vehicleのvalidatesでrollbackされる
      if model.save && vehicle.save
        true
      else
        add_errors
        raise ActiveRecord::Rollback
      end
    end
    errors.blank?
  end

  private

  def assigns
    vehicle.assign_attributes(vehicle_params)
    build_asscociations
  end

  def add_errors
    # TODO: errorsをいい感じにする
    errors.add(:model, model.errors.full_messages) if model.errors.present?
    errors.add(:vehicle, vehicle.errors.full_messages) if vehicle.errors.present?
  end

  def vehicle_params
    { year: year }
  end

  def build_asscociations
    model.brand = brand
    vehicle.model = model
  end
end
