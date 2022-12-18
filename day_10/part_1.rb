require_relative "cathode_ray_tube"

input = File.read("day_10/input").chomp
signal_receiver = CathodeRayTube::SignalReceiver.new(
  cycles_to_track: [20, 60, 100, 140, 180, 220]
)
cpu_program_executor = CathodeRayTube::CpuProgramExecutor.new(
  signal_receiver: signal_receiver,
  program: input
)
cpu_program_executor.execute
signal_strengths = signal_receiver.cycle_results.sum { |cycle, x| cycle * x }
p signal_strengths
