<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Downloads</title>
    <link rel="stylesheet" href="style/main.css" type="text/css"/>
    <style>
        table { border-collapse: collapse; width: 500px; }
        th, td { border: 1px solid black; padding: 5px; text-align: left; }
    </style>
</head>
<body>
    <h1>Downloads</h1>
    
    <h2>Album: ${productCode}</h2>
    
    <p>Thank you for registering! Here are your download links:</p>
    
    <table>
        <tr>
            <th>Song title</th>
            <th>Audio Format</th>
        </tr>
        <tr>
            <td>You Are a Star</td>
            <td><a href="#">MP3</a></td>
        </tr>
        <tr>
            <td>Don't Make No Difference</td>
            <td><a href="#">MP3</a></td>
        </tr>
    </table>
    
    <br>
    <p><a href="download?action=viewAlbums">View list of albums</a></p>
</body>
</html>