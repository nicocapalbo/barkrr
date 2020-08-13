import consumer from "./consumer";

const initConversationCable = () => {
  // console.log("Henlo chatto JS")
  const messagesContainer = document.getElementById('messages');
  const current_user = messagesContainer.dataset.currentUser
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;
    // console.log(id)
    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        // console.log(data); // called when data is broadcast in the cable
        if (current_user == data.message_author){
          messagesContainer.insertAdjacentHTML('beforeend', data.user_is_author_partial);
        } else {
          messagesContainer.insertAdjacentHTML('beforeend', data.user_is_not_author);
        }
          messagesContainer.scrollIntoView(false)
        // messagesContainer.insertAdjacentHTML('beforeend', data);
        // messagesContainer.scrollIntoView(false)
      },
    });
  }
}

export { initConversationCable };
