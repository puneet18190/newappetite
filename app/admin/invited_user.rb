ActiveAdmin.register_page "Invited User" do
  content title: "Invited User" do
    columns do
      column do
        panel "#{User.where(:invite_user => true).count} Invited User" do
          table do
            th do
              "Email ID"
            end
            User.where(:invite_user => true).map do |post|
              tr do
                td link_to(post.email)
              end
            end
          end
        end
      end
    end
  end
end