require 'wistia'

# Wistia.password = ENV["WISTIA_SECRECT_KEY"]
Wistia.password = '1aa99382734432207a69b7cb461311ccdadab3a8275b21c8de66cb1ffd696d5b'
project_id = 'ma2vo0l9bd'
project = Wistia::Project.find(project_id)
p project


