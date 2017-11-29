for t = 0:0.01:0.99
  for k = 0:3
      y = harm(k, t);
      subplot(2, 4, k+1);
      plot([0 real(y)], [0 imag(y)]);
      title("k="+k);
      xlabel("x-Richtung");
      ylabel("y-Richtung");
      xlim([-1.5 1.5]);
      ylim([-1.5 1.5]);
      subplot(2, 4, k+5);
      plot([0 real(y)], [0 0]);
      hold on
      plot([0 0], [0 imag(y)]);
      hold off
      xlabel("Realanteil");
      ylabel("Imaginäranteil");
      title("k="+k);
      xlim([-1.5 1.5]);
      ylim([-1.5 1.5]);
  end
  pause(0.1);
end