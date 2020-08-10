import consumer from "./consumer";

const initConversationCable = () => {
  // console.log("Henlo chatto JS")
  const messagesContainer = document.getElementById('messages');
  // console.log(messagesContainer)
  if (messagesContainer) {
    const id = messagesContainer.dataset.conversationId;
    // console.log(id)
    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        // console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
        messagesContainer.scrollIntoView(false)
      },
    });
  }
}

export { initConversationCable };
