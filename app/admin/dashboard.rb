ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
       column do
         panel "Invited Users" do
           ul do
             User.where(:invite_user => false).map do |post|
               li link_to(post.email) do
                 button class: "invite_user",id: "#{post.id}" do
                   "Invite"
                end
               end
             end
           end
         end
       end
    end
  end
end
