class DimensionsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
    width = options[:width]
    height = options[:height]

    record.errors[attribute] << "La largeur doit être de #{width} px" unless dimensions.width == width
    record.errors[attribute] << "La hauteur doit être de #{height} px" unless dimensions.height == height
  end
end
