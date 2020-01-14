crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", '/users/1'
  parent :root
end
crumb :sign_out do
  link "ログアウト", sign_out_path
  parent :mypage
end


crumb :check_user do
  link "本人情報の登録", check_user_path
  parent :mypage
end

crumb :edit_user do
  link "プロフィール編集", edit_user_path
  parent :mypage
end

crumb :item_show do|item|
  link item.name, edit_user_path
  parent :root
end



# crumb :mypage do
  # link "マイページ", users_show_path
  # parent :root
# end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).