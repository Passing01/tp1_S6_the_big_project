require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::File.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::File.new("public", prefix: "uploads/store")
}
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :validation_helpers

Shrine.attachments = {
  potin_image: Shrine::Attachment.new(:cache, :store),
}
