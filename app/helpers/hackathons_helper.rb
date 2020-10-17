module HackathonsHelper

  def calculate_level_average(hackathon)
    if hackathon.reviews.any?
      num_of_level = 0
      sum_of_level = 0
      hackathon.reviews.each do |review|
        sum_of_level += review.level
        num_of_level += 1
      end
      sum_of_level / num_of_level
    else
      0
    end
  end
end
