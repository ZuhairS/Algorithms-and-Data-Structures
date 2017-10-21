def hash_directory(hash)
  result = []

  hash.each do |folder, value|
    if value.is_a? Hash
      hash_directory(value).each { |key| result << "#{folder}/#{key}" }
    elsif value == true
      result << folder
    end
  end

  result
end

files = {
  'a' => {
    'b' => {
      'c' => {
        'd' => {
          'e' => true
        },

        'f' => true
      }
    }
  }
}

p hash_directory(files)
