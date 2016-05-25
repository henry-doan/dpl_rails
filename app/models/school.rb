class School < ActiveRecord::Base
	#associations 
		# Dependent Destroy will delete
		# all records in the has_many association
		# This is best practice
		has_many :classrooms, dependent: :destroy
		has_one :address, dependent: :destroy

	#validation
		# vaildations go here
		# second line of defense for bad data
		# presence -most used anyhting that isnst nil
		validates_presence_of :name
		# uniqueness - most used on emails / usernames
		validates_uniqueness_of :name

		# used but not oftern
		# size
		#inclusions
			# validates :size, inclusion: {in: (1900..2016)}
		# length
			# validates :name, length: {minimum: 2, maximum: 50}
		# numericality
		# validates :year_built, numericality: {only_integers: true}

		before_create :default_year_built
#callback
	private
	# callbacks go here
	# you proably wont use these mush in basic rails app
		def default_year_built
			self.year_built = '2016' if self.year_built.empty?
		end
end
