# brewber-ios

## Requests

#### Log In Request
```
{
    "email": "alexjbrashear@gmail.com",
    "password": "********"
}
```

#### Log Out Request
```
{
    "not sure"   
}
```

#### Sign Up Request
```
{
    "email": "...",
    "password": "...",
    ...what other information?
}
```

#### Nearby Bars Request
```
{
    "receiver_location": "Not sure what form this should come in",
    "sender_location": "Not sure what form this should come in"
}
```

#### Bar Information Request
```
{
    "id": 1234567890
}
```

## Responses

#### Log In Response
```
{
}
```

#### Log Out Response
```
{
}
```

#### Sign Up Response
```
{
}
```

#### Nearby Bars Response
```
{
}
```

#### Bar Information Response
```
{
    "name": "Pony Bar"
    "id": 1234567890
    "location": "not sure how to represent this yet"
    "menu": [
        {
            "title": "Drafts",
            "drinks": [
                {
                    "name": "Guiness",
                    "type": "dark beer",
                    "description": ""
                },
                {
                    "name": "Blue Moon Summer",
                    "type": "beer",
                    "description": "Seasonal draft"
                }
            ]
        },
        {
            "title": "Shots",
            "drinks": [
                {
                    "name": "Patron",
                    "type": "shot",
                    "description": "tequila shot"
                },
                {
                    "name": "Ketel One",
                    "type": "shot",
                    "description": "vodka shot"
                }
            ]
        },
        {
            "title": "Drinks",
            "drinks": [
                {
                    "name": "Manhattan",
                    "type": "cocktail",
                    "description": "honestly don't know what goes into these"
                },
                {
                    "name": "Cosmopolitan",
                    "type": "martini",
                    "description": "honestly don't know what goes into these"
                }
            ]
        }
    ]
}
```
