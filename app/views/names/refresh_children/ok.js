
$('.message-container').html('');
$('#name-refresh-children-info-message-container').html('Children changed: <%= @total %>');
$('#confirm-name-refresh-children-button').removeAttr('disabled')
$('#cancel-refresh-children-link').removeAttr('disabled')
$('#name-refresh-children-link').removeClass('disabled');
$('#refresh-children-spinner').addClass('hidden');
$('#confirm-or-cancel-refresh-children-link-container').addClass('hidden');
