<script>
	$("#leaveroom").popover({
		placement: "bottom"
	});
	$("#help").popover({
		placement: "bottom"
	});
	$("#export_chat_history").popover({
		placement: "bottom"
	});
	<% publish_to room_path(@room)+'_user_list' do %>
		//$("#userlist").append("<%= j render partial: 'rooms/user', locals: {user: current_user} %>")
	<% end %>
	PrivatePub.subscribe('<%= room_path(@room) + "_user_list_leaves" %>', function(data, channel) {
		var name_to_delete = data.name;
		var dom;
		$("#userlist p").each(function(i,e){
			if($(e).text() == name_to_delete) {
				$(e).remove();
			}
		})
	});
	<% subscribe_to room_path(@room)+'_user_list_leaves' do %>
		$("#userlist").append("<%= j render partial: 'rooms/user', locals: {user: current_user} %>")
	<% end %>
</script>