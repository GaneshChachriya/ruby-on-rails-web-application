starting online ruby learning ROR with AWS
<h1>Welcome to Alphablog home page</h1>
<%= link_to 'Articles listing', articles_path %>
<%= link_to 'About page', about_path %>
<a class="navbar-brand" id="logo" href="#">ALPHABLOG</a>
 <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
 <table>
    <thead>
        <tr>
            <th>title</th>
            <th>Description</th>
            <th colspan='3'>Action</th>
        </tr>
    </thead>
    
    <tbody>
        <% @articles.each do |article| %>
        <tr>
            <td><%= article.title %></td>
            <td><%= article.Description %></td>
            <td><%= link_to 'show', article_path(article) %></td>
            <td><%= link_to 'edit', edit_article_path(article) %></td>
            <td><%= link_to 'delete', article_path(article), method: :delete, data: { confirm: 'are you sure?'} %></td>
        </tr>
        <% end %>
    </tbody>
</table>
<p>