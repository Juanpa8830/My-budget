<div class="splash">
  <div class="splash-title">
    <h1>My Budget</h1>
  </div>
  <div class="splash-buttons-container">
    <%= button_to "LOG IN", new_user_session_path, class: "splash-button" %>
    <%= button_to "SIGN UP", new_user_registration_path,  method: :get, class: "splash-button" %>
  </div>
</div>