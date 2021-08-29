
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

class StarCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _repositoryName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'GitHub Star Counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Enter a GitHub repository',
                      hintText: 'flutter/flutter',
                    ),
                    onSubmitted: (text) {
                      setState(() {
                        _repositoryName = text;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: GitHubStarCounter(
                      repositoryName: _repositoryName,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.blue),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () => launch(
                      '/privacy_policy.html',
                      enableJavaScript: true,
                      enableDomStorage: true,
                    ),
                    child: const Text('Privacy Policy'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class GitHubStarCounter extends StatefulWidget {
  /// The full repository name, e.g. torvalds/linux
  final String repositoryName;

  const GitHubStarCounter({
    required this.repositoryName,
  });

  @override
  _GitHubStarCounterState createState() => _GitHubStarCounterState();
}

class _GitHubStarCounterState extends State<GitHubStarCounter> {
  // The GitHub API client
  late GitHub github;

  // The repository information
  Repository? repository;

  // A human-readable error when the repository isn't found.
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    github = GitHub();

    fetchRepository();
  }

  @override
  void didUpdateWidget(GitHubStarCounter oldWidget) {
    super.didUpdateWidget(oldWidget);

    // When this widget's [repositoryName] changes,
    // load the Repository information.
    if (widget.repositoryName == oldWidget.repositoryName) {
      return;
    }

    fetchRepository();
  }

  Future<void> fetchRepository() async {
    setState(() {
      repository = null;
      errorMessage = null;
    });

    if (widget.repositoryName.isNotEmpty) {
      try {
        var repo = await github.repositories
            .getRepository(RepositorySlug.full(widget.repositoryName));
        setState(() {
          repository = repo;
        });
      } on RepositoryNotFound {
        setState(() {
          repository = null;
          errorMessage = '${widget.repositoryName} not found.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textStyle = textTheme.headline4?.apply(color: Colors.green);
    final errorStyle = textTheme.bodyText1?.apply(color: Colors.red);
    final numberFormat = intl.NumberFormat.decimalPattern();

    if (errorMessage != null) {
      return Text(errorMessage!, style: errorStyle);
    }

    if (widget.repositoryName.isNotEmpty && repository == null) {
      return const Text('loading...');
    }

    if (repository == null) {
      // If no repository is entered, return an empty widget.
      return const SizedBox();
    }

    return Text(
      numberFormat.format(repository!.stargazersCount),
      style: textStyle,
    );
  }
}