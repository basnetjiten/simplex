import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplex/simplex_paging.dart';
import 'package:simplex/simplex_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simplex Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simplex Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PaginationPage()),
              ),
              child: const Text('Pagination Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FormPage()),
              ),
              child: const Text('Form Demo'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginationPage extends StatelessWidget {
  const PaginationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagingCubit<int, String>(
        initialKey: 1,
        useCache: true,
        fetchFn: (page, search) async {
          // Simulate API call
          await Future.delayed(const Duration(seconds: 1));
          final items = List.generate(10, (i) => 'Item ${(page - 1) * 10 + i}');
          final nextKey = page < 5 ? page + 1 : null;
          return (items, nextKey);
        },
      )..fetchNext(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Pagination Demo')),
        body: BlocBuilder<PagingCubit<int, String>, PagingState<int, String>>(
          builder: (context, state) {
            if (state.isLoading && state.items.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return RefreshIndicator(
              onRefresh: () => context.read<PagingCubit<int, String>>().refresh(),
              child: ListView.builder(
                itemCount: state.items.length + (state.hasNextPage ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == state.items.length) {
                    context.read<PagingCubit<int, String>>().fetchNext();
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return ListTile(title: Text(state.items[index]));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SimplexFormField(
              controller: _emailController,
              hintText: 'Enter your email',
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Email is required';
                if (!value.contains('@')) return 'Invalid email';
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle submit
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
