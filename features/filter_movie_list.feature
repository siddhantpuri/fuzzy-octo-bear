Feature: display list of movies filtered by MPAA rating
 
	As a concerned parent
	So that I can quickly browse movies appropriate for my family
	I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

	Given the following movies exist:
	| title                   | rating | release_date |
	| Aladdin                 | G      | 25-Nov-1992  |
	| The Terminator          | R      | 26-Oct-1984  |
	| When Harry Met Sally    | R      | 21-Jul-1989  |
	| The Help                | ratings_PG-13  | 10-Aug-2011  |
	| Chocolat                | ratings_PG-13  | 5-Jan-2001   |
	| Amelie                  | R      | 25-Apr-2001  |
	| 2001: A Space Odyssey   | G      | 6-Apr-1968   |
	| The Incredibles         | ratings_PG     | 5-Nov-2004   |
	| Raiders of the Lost Ark | ratings_PG     | 12-Jun-1981  |
	| Chicken Run             | G      | 21-Jun-2000  |

	And  I am on the RottenPotatoes home page

Scenario: restrict to movies with 'ratings_PG' or 'R' ratings
	# enter step(s) to check the 'ratings_PG' and 'R' checkboxes
	When I check the following ratings: ratings_PG-13, ratings_R
	# enter step(s) to uncheck all other checkboxes
	And I uncheck the following ratings: ratings_PG, ratings_G
	# enter step to "submit" the search form on the homepage
	Then I press ratings_submit
	# enter step(s) to ensure t sunhat ratings_PG and R movies are visible
	Then I should see movies with rating PG, R
	# enter step(s) to ensure that other movies are not visible
	And I should not see movies with rating ratings_PG-13, ratings_G

Scenario: all ratings selected
	# see assignment
	Given I check the following ratings: ratings_G, ratings_PG, ratings_PG-13, ratings_R
	And I press ratings_submit
	Then I should see all the movies