ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
       column do
         panel "#{User.where(:invite_user => false).count} Invitation Wait List" do
           table do
             div id: "load-ajax"
             th do
               "Email ID"
             end
             th do
               "Action"
             end
             User.where(:invite_user => false).map do |post|
               tr do
                 td link_to(post.email)
                 td do
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
end
