case Rails.env
when "development"
	chris = User.create(username: "chriscirefice", password: "chris", email: "email@domain.com", name: "chris",
						birthday: DateTime.parse("1992-10-12 00:00:00"), ethnicity: ["white"],
						relationship_status: 0, relationship_type: 0, longest_relationship: 1, height: 168,
						body_type: 1, hair_color: 2, eye_color: 2, diet: 0, smoking: 0, drinking: 1,
						drugs: 0, religion: 3, religion_importance: 0, education: 4, education_status: 0,
						ambitiousness: 3, has_children: false, wants_children: 4, catch: "Chris is a cool guy!",
						summary: "A summary", current_life: "What I'm doing with my life", free_time: "What I do in my free time",
						favorite: "My favorite things", most_important: "Things that are most important to me",
						talk_more: "We should talk if...", gender_interest: 0, age_min: 18, age_max: 32, desire_single: true,
						desire_near: false, relationship_interest: ["new friends", "long-term dating"])
when "production"
end