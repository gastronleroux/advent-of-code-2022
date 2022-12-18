require_relative "cathode_ray_tube"

input = File.read("day_10/input").chomp
signal_receiver = CathodeRayTube::SignalReceiver.new
cpu_program_executor = CathodeRayTube::CpuProgramExecutor.new(
  signal_receiver: signal_receiver,
  program: input
)
cpu_program_executor.execute
pp signal_receiver.draw_crt
