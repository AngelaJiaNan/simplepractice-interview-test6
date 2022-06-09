My Approach for SimplePractice Programming Test
=======================

In my solution, I have included endpoints for appointments & doctors. To test each requirement I used Postman, the rails console and attempted to write some test cases in the spec folder.

Requirement 1:

The goal for requirement 1 was to seed the data into the database. I used a nested loop, the outer loop created 10 doctors, the middle loop created 10 patients per doctor and the inner loop created 10 appointments for each of the patients.

I also installed the faker gem to create patient and doctor names. In addition, I used the rails console to print out what is in the database.

Requirement 2:

The goal for requirment 2 was to structure a response returning all appointments from 'api/appointments' endpoint. After returning the appointments, I noticed I was returning unstructured records from the database so I then decided to format each record into an object with the necessary keys and push that object into an appointments array.

I also considered using serialization as well.

Requirement 3:

The goal for requirement 3 was to allow the 'api/appointments' endpoint to return filtered records.

To check each parameter I set up an if/else statement. For example: one of the url params was if params[:past] == 1 then return only appointments in the past and if params[:past] == 0 then return only appointments in the future. I used an less than(past) or greater than(future) operator and compared that Time.zone.now.

The last if/else statement refers to paginated appointments. For this I used .limit() to limit the number of appointments returned and .offset() to designate how many records to skip before starting to return reocrds. The value for offset I calculated by first subtracting 1 from the page params value, and then multiplying by the length to get what I thought of as the beginning of when I wanted to start to return.

Requirement 4

The goal for requirment 4 was to create a new endpoint 'api/doctors' returning all doctors without an appointment.

I created a new controller and route for doctors. I used .map() to loop through all the doctors that didn't have an appointment. I also considered using .pluck aswell.

Requirement 5

The goal for requirment 5 was to create a POST endpoint to create new appointments.

I used the create method to create the endpoint and then used params to query the patient table for the patient record and Id. Then I made a checkpoint to let users know if the appointment was saved or not.

Conclusion

I enjoyed challenging myself with this exercise. This was the first time I saw yet alone programmed in Ruby so please be kind, but I thought of it as a valuable learning experience and really neat to be able to see how other languages are structured. I wouldn't consider myself an expert in ROR just yet, but with more time I'm sure it'll come easier and appear more familiar. I am excited for feedback.








SimplePractice Programming Test
=======================

The goal of the SimplePractice programming test is to evaluate the programming abilities
of candidates. The ideal candidate would know Ruby, JavaScript, or another language with
great proficiency, be familiar with basic database and HTTP API principles, and able to
write clean, maintainable code. This test gives candidates a chance to show these
abilities.

Getting Your Environment Ready
------------------------------

You'll need a development computer with access to github.com. You'll also need to set up
Docker CE (https://www.docker.com/community-edition), which is free. Sample `Dockerfile`
and `docker-compose.yml` files are included in this repo along with a basic scaffolded
Rails application.

There is a `Makefile` included for your convenience that has sample commands for building
and managing your application via the command line.

Please make sure you can bring up your app with `make up` well before the start of the
test. You should be able to run the tests if the basic setup works.

```bash
$ make
$ make build
$ make dbcreate
$ make test
```

If you need to use generators with docker:

```bash
docker-compose run app bundle exec rails scaffold users
```

Or, alternatively, you can "ssh" into the container (to exit, type `exit` or `ctrl + d`)

```bash
$ make bash
$ bundle exec rails g scaffold users
```

**NOTE** since the generator runs inside of Docker (and this container runs as
the `root` user), you will need to change the permissions of the generated
files. The following command is added as a convenience and should be run after
generated files are created to avoid "write permission" failures.

```bash
sudo chown -R $USER .
```

OR

```bash
make chown
```

Evaluation Criteria
-------------------

When evaluating the program, the following are among the factors considered:

 * Does it run?
 * Does it produce the correct output?
 * How did _you_ gain confidence your submission is correct?
 * Were appropriate algorithms and data structures chosen?
 * Was it well written? Are the source code and algorithms implemented cleanly?
   Would we enjoy your code living along side our own?
 * Is it slow? For small to medium sized inputs, the processing delay should
   probably not be noticeable.
