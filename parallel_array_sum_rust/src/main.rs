use std::sync::Arc;
use std::thread;

fn main() {
    let arr: Arc<Vec<u64>> = Arc::new((0..=1e8 as u64).collect());
    let chunk_size = 1e5 as usize;

    let thread_count = arr.len() / chunk_size;
    let mut thread_handles: Vec<thread::JoinHandle<u64>> = vec![];

    for idx in 0..thread_count {
        let arr_pt = Arc::clone(&arr);
        thread_handles.push(thread::spawn(move || {
            arr_pt[idx * chunk_size..chunk_size * idx + 1].iter().sum()
        }));
    }

    let mut all_sum = 0;
    for th in thread_handles {
        all_sum += th.join().unwrap();
    }

    println!("Sum of array is {all_sum}");
}
