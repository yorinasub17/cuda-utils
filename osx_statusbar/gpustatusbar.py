import rumps
import pycuda.autoinit
import pycuda.driver as cuda

class GPUStatusBar(rumps.App):
    def __init__(self):
        super(GPUStatusBar, self).__init__()

    @rumps.timer(2)
    def periodic_checker(self, sender):
        (free, total) = cuda.mem_get_info()
        self.title = '{0:.2f}% GPU memory utilization'.format(float(free) / total * 100)

if __name__ == "__main__":
    GPUStatusBar().run()
